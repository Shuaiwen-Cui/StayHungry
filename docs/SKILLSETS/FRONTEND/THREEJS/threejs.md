-> [中文](/SKILLSETS/FRONTEND/THREEJS/threejs-cn.md)

# THREE.JS
> Official Website: [🌐 https://threejs.org/](https://threejs.org/)
- Docs
- Tutorials
- Demos

> ThreeJS Journey: [🌐 https://threejs-journey.com/](https://threejs-journey.com/)
- by Bruno Simon
- Charged Course
- High Quality
- One-stop Learning

# THREE.JS JOURNEY NOTES

# A BASICS - CH01 INTRODUCTION

> What you will learn from this course.

# A BASICS - CH02 WHAT IS WEBGL AND WHY USE THREE.JS?

> What is WebGL?

WebGL is a %%JavaScript API%% that renders triangles in a canvas at a remarkable speed. It's compatible with most modern browsers, and it's fast because it uses the %%Graphic Processing Unit (GPU)%% of the visitor.

WebGL can draw more than triangles and can also be used to create 2D experiences, but we will focus on 3D experiences using triangles for the course's sake.

The GPU can do thousands of parallel calculations. Imagine that you want to render a 3D model and this model is constituted of 1000 triangles—which, come to think about it, is not that many. Each triangle includes 3 points. When we want to render our model, the GPU will have to calculate the position of these 3000 points. Because the GPU can do parallel calculations, it will handle all the triangles points in one raw.

Once the model's points are well placed, the GPU needs to draw each visible pixel of those triangles. Yet again, the GPU will handle the thousands and thousands of pixels calculations in one go.

The instructions to place the points and draw the pixels are written in what we call **shaders**. **And let me tell you, shaders are hard to master. We also need to provide data to these shaders. For example: how to place the points according to the model transformations and the camera's properties. These are called matrices. We also need to provide data to help colorize the pixels.** If there is a light and the triangle is facing that light, it should be brighter than if the triangle isn't.

And this is why **native WebGL** is **so hard**. Drawing a single triangle on the canvas would take at least 100 lines of code. Good luck if you want to add perspective, lights, models, and animate everything in that case.

But **native WebGL** benefits from existing at a **low level**, very close to the GPU. This enables excellent optimizations and more control.

> What is Three.js?

Three.js is a JavaScript library under MIT license that works **right above WebGL**. **The library's goal is to drastically simplify the process of handling all of what we just stated.** You'll have an animated 3D scene in just a few code lines, and you won't have to provide shaders and matrices.

Because Three.js is right above WebGL, we can still interact with it in some ways. At some point, we will get to writing shaders and create matrices.

Ricardo Cabello, aka Mr.doob (Website, Twitter), is the developer who created Three.js. He is still working on it, but now he's helped by a large community. You can check the list of contributors here: https://github.com/mrdoob/three.js/graphs/contributors

Currently, the library gets an update every month and you can see what's changed in the releases page here: https://github.com/mrdoob/three.js/releases

You can discover many exceptional projects using Three.js on the website's homepage: https://threejs.org/

There is also some well-maintained documentation that we will use a lot: https://threejs.org/docs/index.html#manual/en/introduction/Creating-a-scene

And you can find hundreds of examples with public code here: https://threejs.org/examples/#webgl_tonemapping

If you want to follow updates and discover exceptional projects, I advise you to follow the Mr.doob and Three.js twitter accounts:

https://twitter.com/mrdoob

https://twitter.com/threejs

# A BASICS - CH03 FIRST THREEJS PROJECT

> Env Building - VITE

> How to create a project
- Build a folder named 'exercise'
- Open with VSCode
- Open built-in terminal
- Run 'npm init -y'
- Run 'npm install vite'

> Key elements
- Scene
  - construct objects first
    - geometry
    - material
    - mesh
  - add objects to scene
- Camera
  - field of view - vertical angle
  - aspect ratio - width / height
  - near plane - distance from camera to near clipping plane
  - far plane - distance from camera to far clipping plane
- Renderer

# A BASICS - CH04 TRANSFORM OBJECTS
> Introduction
- Transformations
  - Position
  - Rotation
  - Scale
  - Quaternion
- Coordinates
  - x pointing to the right
  - y pointing up
  - z pointing towards us

# A BASICS - CH05 ANIMATION
- requestAnimationFrame



# A BASICS - CH06 CAMERA

- camera parameters: 
  - field of view
    - vertical angle
  - aspect ratio
    - width / height
  - near plane 
    - distance from camera to near clipping plane
  - far plane - don't be too far - z-fighting
    - distance from camera to far clipping plane

- camera size - render size

- control camera

- cursor position
  - normalized device coordinates
    - x: -1 to 1
    - y: -1 to 1
  - world coordinates
    - x: -width/2 to width/2
    - y: -height/2 to height/2

- Threejs built-in control
  - DeviceOrientationControls
    - it will automatically retrieve the device orientation and move the camera accordingly.
  - FlyControls
  - FirstPersonControls
    - nothing to do with FPS
  - PointerLockControls
    - it will lock the cursor in the center of the screen and move the camera according to the cursor's movements.
    - Also can use JS method
  - OrbitControls* - used in the tutorial - [drag to rotate, scroll to zoom]
    - it will move the camera around a target point, and it will always face that point.
  - TrackballControls
    - it will move the camera around a target point, and it will always face that point.
  - TransformControls
    - it will move, rotate, and scale an object in the scene.
    - nothing to do with camera
  - DragControls
    - it will move an object in the scene.
    - nothing to do with camera

- Damping
  - it will slow down the camera's movements.
  - it will make the camera's movements smoother.

# A BASICS - CH07 FULLSCREEN AND RESIZING
- Screen
  - Window
    - Viewport
      - Canvas
        - Renderer
          - Scene
            - Camera
            - Object
              - Mesh
                - Geometry
                - Material
note: the above hierarchy may not be accurate, just my current understanding

- margin, paddin = 0

- Resize

- Sawtooth effect

- Pixel Ratio

- Full Screen

# A BASICS - CH08 GEOEMETRY
- Geometry
  - vertices
    - position
    - normal
    - uv
    - color
    - index
    - custom attributes
    - custom groups
    - etc

- Threejs built-in geometry
  - Geometry
    - BoxGeometry
    - PlaneGeometry
    - CircleGeometry
    - ConeGeometry
    - CylinderGeometry
    - RingGeometry
    - TorusGeometry
    - TorusKnotGeometry
    - DodecahedronGeometry
    - OctahedronGeometry
    - TetrahedronGeometry
    - IsohedronGeometry
    - SphereGeometry
    - ShapeGeometry
      - Based on Bezier curves
    - TubeGeometry
    - ExtrudeGeometry
    - LatheGeometry
      - curve + rotation
    - TextGeometry

# A BASICS - CH09 DEBUG UI
- debug UIs
  - dat.GUI
  - lil-GUI * - used in the tutorial
  - control-panel
  - ControlKit
  - Uil
  - Tweakpane
  - Guify
  - Oui

- npm install lil-gui

- be careful with the color