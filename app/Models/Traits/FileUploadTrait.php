<?php
namespace App\Models\Traits;

use Illuminate\Support\Facades\File;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Intervention\Image\Facades\Image;
use ProtoneMedia\LaravelFFMpeg\Support\FFMpeg;

trait FileUploadTrait
{
    /**
     * Upload file trait
     *
     * @param string $field
     * @param array $path
     * @return ?string
     */
    public function uploadFile($field,$params,$path)
    {
        // Convert path
        $path = $this->destinationPath($path);

        // Make sure path exists
        if (! Storage::exists($path)) {
            Storage::makeDirectory($path);
        }

        //remove Old Files
        $file_path = $this->{$field};
        if(!empty($file_path)){
                $storagePath = str_replace(env('APP_URL') . '/storage', '', $file_path);
                if (Storage::exists($storagePath)) {
                    Storage::delete($storagePath);
                }
        }
        // Store file to the storage and save path to database

        if(is_array($params)){
            $files = [];
            foreach ($params as $param){
                $name = time().rand(1,100).'.'.$param->extension();
                $filePath = Storage::putFileAs($path, $param,$name);
                $files[] = $filePath;

            }
        }else {
            $name = time().rand(1,100).'.'.$params->extension();
            $filePath = Storage::putFileAs($path, $params,$name);
            $files = $filePath;

        }
        $this->{$field} = $files;
        $this->save();

    }
    /**
     * Generate destination folder for saving files
     *
     * @param array $args
     * @return string
     */
    private function destinationPath(array $args): string
    {
        return join('/', [
            ...$args,
        ]);
    }

}
