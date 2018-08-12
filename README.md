# Receive the answer, process it and show the list of restaurants in the table

================================
## Task 
 There is an URL https://eda.yandex/api/v2/catalog?latitude=55.762885&longitude=37.597360
 The answer comes in json format.
 
 It is necessary to receive the answer, process it and show the list of restaurants in the table.
 
 For each restaurant it is necessary to show:
 * Image (size 100x75) (left, top)
 * Name (to the right of the image, from above)
 * Description (to the right of the image, under the name)
 
 All string values must be carried. A font can be any.
 
 In case of errors show an alert that something has happened and invite the user to repeat the request.
 
 ## Additional conditions:
 There are 3 libraries for working with images: `SDWebImage`, `Kingfisher` and `Nuke`.
 In the application, it is possible to switch between these libraries and the ability to reset the image cache.


## Installation
1. Run **pod install** after project cloning:

      ```  
        pod install
    ```

## Supported Platforms

- iOS

## Screenshots

![output](https://user-images.githubusercontent.com/27812408/44002336-a7457ab2-9e49-11e8-8f89-6f5e8b6d1e90.gif)



