Building an Oracle Unified Directory Services Manager Image with Dockerfiles and Scripts
========================================================================================

## Contents

1. [Introduction](#1-introduction)
1. [Hardware and Software Requirements](#2-hardware-and-software-requirements)
1. [How to build the Oracle Java image](#3-how-to-build-the-oracle-java-image)
1. [How to Build the Oracle Fusion Middleware Infrastructure image](#4-how-to-build-the-oracle-fusion-middleware-infrastructure-image)
1. [Building Oracle Unified Directory Services Manager image](#5-building-oracle-unified-directory-services-manager-image)

# 1. Introduction
This project offers scripts to build an Oracle Unified Directory Services Manager image based on 12cPS4 (12.2.1.4.0) release. Use this image to facilitate installation, configuration, and environment setup for DevOps users. 

This image refers to binaries for Oracle Unified Directory Services Manager Release 12.2.1.4.0 and it has the capability to create a Fusion Middleware Infrastructure domain with the Oracle Unified Directory Services Manager application deployed in a container with Oracle Unified Directory Services Manager deployed which can be targeted for development and testing.

***Image***: `oracle/oudsm:12.2.1.4.0`

# 2. Hardware and Software Requirements
Oracle Unified Directory Services Manager image has been tested and is known to run on following hardware and software:

## 2.1 Hardware Requirements

| Hardware  | Size  |
| :-------: | :---: |
| RAM       | 16GB  |
| Disk Space| 200GB+|

## 2.2 Software Requirements

|       | Version                        | Command to verify version |
| :---: | :----------------------------: | :-----------------------: |
| OS    | Oracle Linux 7.3 or higher     | more /etc/oracle-release  |
| Docker| Docker version 18.03 or higher | docker version            |

# 3. How to Build the Oracle Java image

Please refer to [README.md](../../../OracleJava/README.md) under `docker-images/OracleJava` for details on how to build Oracle Java image.

# 4 How to Build the Oracle Fusion Middleware Infrastructure image

Please refer to [README.md](../../../OracleFMWInfrastructure/README.md) under `docker-images/OracleFMWInfrastructure` for details on how to build Oracle Fusion Middleware Infrastructure image.

Oracle Unified Directory Services Manager Dockerfile uses the `oracle/fmw-infrastructure:12.2.1.4.0` tag to refer to Oracle Fusion Middleware Infrastructure image, hence you should use this tag for the same.

# 5. Building Oracle Unified Directory Services Manager image

## Clone and download Oracle Unified Directory Services Manager docker scripts and binary file

1. Clone the [GitHub repository](https://github.com/oracle/docker-images).
The repository contains dockerfiles and scripts to build images for Oracle products.
2. You must download and save the Oracle Unified Directory Services Manager 12.2.1.4.0 binary into the cloned/downloaded repository folder at location : `OracleUnifiedDirectorySM/dockerfiles/12.2.1.4.0/` (see **Checksum** for file name which is inside dockerfiles/12.2.1.4.0/oud.download).

## Build Oracle Unified Directory Services Manager image using cloned/downloaded docker-images repository

To assist in building the image, you can use the [`buildDockerImage.sh`](dockerfiles/buildDockerImage.sh) script. See below for instructions and usage.

The `buildDockerImage.sh` script is a utility shell script that takes the version of the image that needs to be built. Expert users are welcome to directly call `docker build` with their prefered set of parameters.

**IMPORTANT**: If you are building the Oracle Unified Directory Services Manager image, you must first download the Oracle Unified Directory 12.2.1.4.0 binary (fmw_12.2.1.4.0_oud.jar) and locate it in the folder, `./dockerfiles/12.2.1.4.0`.

**IMPORTANT**: To build the Oracle Unified Directory Services Manager image with patches, you need to download and drop the patch zip files (for e.g. p31400392_122140_Generic.zip) into the `patches/` folder under the version which is required, for e.g. for 12.2.1.4.0 the folder is `12.2.1.4/patches/`.  Similarly, `OPatch` patches can be kept in the `opatch_patch/` folder (for 12.2.1.4.0 the folder is `12.2.1.4/opatch_patch`). Then run the `buildDockerImage.sh` script:

Note: Copy the **fmw_12.2.1.4.0_oud.jar** under the directory "OracleUnifiedDirectorySM/dockerfiles/12.2.1.4.0"

    Build script "buildDockerImage.sh" is located at "OracleUnifiedDirectorySM/dockerfiles"

        $ sh buildDockerImage.sh
        Usage: buildDockerImage.sh -v [version]
        Builds a Docker Image for Oracle Unified Directory Services Manager

        Parameters:
           -v: version to build. Required.
           Choose : 12.2.1.4.0
           -c: enables Docker image layer cache during build
           -s: skips the MD5 check of packages

# Licensing & Copyright

## License
To download and run Oracle Fusion Middleware products, regardless whether inside or outside a Docker container, you must download the binaries from the Oracle website and accept the license indicated at that page.

All scripts and files hosted in this project and GitHub [docker-images/OracleUnifiedDirectorySM](./) repository required to build the images are, unless otherwise noted, released under [UPL 1.0](https://oss.oracle.com/licenses/upl/) license.

## Copyright
Copyright (c) 2020, Oracle and/or its affiliates.
Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl
