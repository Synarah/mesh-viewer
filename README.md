# mesh-viewer

Implements a simple PLY viewer

TODO: Add a representative image for your project here

<img width="493" alt="Untitled 13" src="https://user-images.githubusercontent.com/112510953/228303643-7b8fcd0d-4bfe-4958-92ff-55cc72dfcf8e.png">


## How to build

*Windows*

Open git bash to the directory containing this repository.

```
mesh-viewer $ mkdir build
mesh-viewer $ cd build
mesh-viewer/build $ cmake ..
mesh-viewer/build $ start mesh-viewer.sln
```

Your solution file should contain two projects: `mesh-viewer` and `test-ply-mesh`.
To run from the git bash command shell, 

```
mesh-viewer/build $ ../bin/Debug/test-ply-mesh.exe
mesh-viewer/build $ ../bin/Debug/mesh-viewer.exe
```

*macOS*

Open terminal to the directory containing this repository.

```
mesh-viewer $ mkdir build
mesh-viewer $ cd build
mesh-viewer/build $ cmake ..
mesh-viewer/build $ make
```

To run each program from build, you would type

```
mesh-viewer/build $ ../bin/mesh-viewer
```

## Demo of basic features

TODO: Document the core features of your viewer (shaders + models)

Normal Shader:

<img width="496" alt="Untitled" src="https://user-images.githubusercontent.com/112510953/228302122-03f49bd6-7d00-4552-96e5-97bf948e2478.png">
<img width="490" alt="Untitled 7" src="https://user-images.githubusercontent.com/112510953/228302171-90a34a0f-6586-4aa2-9c7a-10b9dd5ff786.png">


Vertex Shader:

<img width="493" alt="Untitled 2" src="https://user-images.githubusercontent.com/112510953/228302272-5ef97ebe-e604-4573-8f47-44ff88ad19b9.png">
<img width="487" alt="Untitled 8" src="https://user-images.githubusercontent.com/112510953/228302311-798900c9-cad1-4775-be71-dbacecc1743e.png">

Pixel Shader:

<img width="498" alt="Untitled 3" src="https://user-images.githubusercontent.com/112510953/228302454-4726e26e-8185-4142-b3d6-aba4c95be7f7.png">
<img width="495" alt="Untitled 9" src="https://user-images.githubusercontent.com/112510953/228302471-86db5022-8ddd-4997-bf72-49f424b59658.png">


## Unique features 

TODO: Show the unique features you made

Two Lightings:

<img width="498" alt="Untitled 4" src="https://user-images.githubusercontent.com/112510953/228302536-ac7e5f76-ca64-4373-b1ff-df2afe35ccf9.png">
<img width="494" alt="Untitled 10" src="https://user-images.githubusercontent.com/112510953/228302565-c2435368-d76b-432e-8d3c-b3f2db41ac7b.png">

Toon Shader:

<img width="497" alt="Untitled 5" src="https://user-images.githubusercontent.com/112510953/228302620-52b81763-fb79-4f77-aee8-5ce07e28aa8b.png">
<img width="495" alt="Untitled 11" src="https://user-images.githubusercontent.com/112510953/228302643-37419ed3-c013-4847-864e-bbbe8a50f6de.png">

Spotlight:

<img width="492" alt="Untitled 6" src="https://user-images.githubusercontent.com/112510953/228302700-55660112-562c-4263-80fe-39c94dacbbc4.png">
<img width="491" alt="Untitled 12" src="https://user-images.githubusercontent.com/112510953/228302711-3c289aa4-d627-4a2c-94ba-cb25cf759349.png">

