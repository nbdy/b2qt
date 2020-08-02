### b2qt
build a boot2qt image with docker<br>
this basically automates [these steps](https://doc.qt.io/QtForDeviceCreation/qtee-custom-embedded-linux-image.html)
#### why?
- i don't have a server running version < ubuntu focal (20)
    - building with focal results in an error
        - glibc apparently replaced stime, which causes that error

#### how to use it
```
# if you just want to build for raspberrypi4 and qt 5.15.0
./b2qt.sh

# if you want to build a completely custom image
./b2qt.sh 5.9.0 raspberrypi0
           |       \> https://doc.qt.io/QtForDeviceCreation/qtee-custom-embedded-linux-image.html#building-the-image-and-toolchain
           |           (the machine table contains the required values)
           \> https://code.qt.io/cgit/yocto/boot2qt-manifest.git/tree/
```

#### output
your image should be in the ./output/ directory<br>
for example if you run the script with the default arguments<br>
there should be a 'raspberrypi4.img' in ./output/