\mainpage Introduction

\section overview_sec Overview

Simultaneous Localization and Mapping (SLAM) is a method of localization that uses LiDAR scans to construct a map of the environment it moves in while determining its position.
This project is [Ethan](https://ethanuppal.com)'s implementation of SLAM.

<table>
    <tr>
        <th style="text-align:left; vertical-align:top">Item</th>
        <th style="text-align:left; vertical-align:top">Location</th>
    </tr>
    <tr>
        <td style="text-align:left; vertical-align:top"><b>Documentation</b></td>
        <td style="text-align:left; vertical-align:top"></td>
    </tr>
    <tr>
        <td style="text-align:left; vertical-align:top"><b>Repository</b></td>
        <td style="text-align:left; vertical-align:top">
            <a href="https://github.com/cornellev/slam">https://github.com/cornellev/sclam</a>
        </td>
    </tr>
    <tr>
        <td style="text-align:left; vertical-align:top"><b>Contents</b></td>
        <td style="text-align:left; vertical-align:top">
            \ref overview_sec <br> 
            \ref install_sec <br> 
        </td>
    </tr>
</table>

\section feature_sec Features

This section has not been completed.

\section install_sec Usage

\warning This section applies only to Unix-like operating systems, such as MacOS and Linux.

First, download and install the dependencies.
**Only eigen3 is necessary for the library. If you only wish to build the library, install eigen3 only. The remaining dependencies are only for the visualization tool.**

| Dependency | Library Location (at which) | Header Location (under which) |
| --- | --- | --- |
| [eigen3](http://eigen.tuxfamily.org/index.php?title=Main_Page) | N/A | `/usr/local/include/eigen3/` |
| [scan-matching](/Users/ethan/Documents/GitHub/scan-matching) | `/usr/local/lib/libcevicp.a` | `/usr/local/include/` |

There is also a dependency on [simple-test](https://github.com/ethanuppal/simple-test) if you want to run the tests (`make test`).
Please follow the installation instructions there.

Next, clone the repository.
```shell
git clone https://github.com/cornellev/slam.git
cd slam
```
