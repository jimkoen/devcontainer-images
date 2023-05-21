# Development Container Images

## What are devcontainers?

[From the official devcontainers repo:](https://github.com/devcontainers/images)
> A development container is a running [Docker](https://www.docker.com/) container with a well-defined tool/runtime stack and its prerequisites. It allows you to use a container as a full-featured development environment which can be used to run an application, to separate tools, libraries, or runtimes needed for working with a codebase, and to aid in continuous integration and testing.
<br>
<br>
This repository contains a set of dev container images which are Docker images built with [dev container features](https://github.com/devcontainers/features).

As hinted at in the text above, the idea is to containerize your development environment. Devcontainers introduce nothing new about this concept, and if you have worked with Docker before, you'll pretty much already know what there is to know.

Devcontainers basicially just mean adding some meta-information to a project with a Dockerfile, that enables the container image resulting from the dockerfile to integrate with some special VSCode features. They are essentially just regular Docker containers with some patched stuff here and there, to allow the injection of custom scripts after startup.

The above enables project maintainers to define a common "baseline" in terms of VSCode extensions used in their project. 

For example: You are on Linux and your project makes heavy use of the [Jupyter Notebook Extension for VSCode](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter) in order to run iPython notebooks. The extension works fine on your end, but alot of MacOS users report non functioning installs in your projects issue tracker. For MacOS, this is the main source of issues, and legitimate problems with your app tend do drown in the waves of troubleshooting issues.

 With devcontainers you can force your MacOS users to use Linux under the hood (but they don't really notice) and have the extension and additional configuration automatically installed. VSCode will detect it in the container, and work like it would when things run on the actual computer.

## Using devcontainers in your project

### Adding necessary files
To containerize your project in a devcontainer, add a `.devcontainer` directory to your project layout:

```
project_root/
├─ .devcontainer/
│  ├─ devcontainer.json
│  ├─ Dockerfile
```

Inside the `.devcontainer` directory, you will need a `devcontainer.json` file and an **optional** Dockerfile. The Dockerfile is only necessary if you want to write a devcontainer image from scratch or extend an existing image. ***It is generally the point of devcontainers to use a common, streamlined template.** If you feel that you need to make significant extensions to a devcontainer image, consider adding the changes in one of the base images in this repository instead.

### `devcontainer.json` metadata layout

[From the official docs:](https://containers.dev/implementors/json_reference/)

> The devcontainer.json file contains any needed metadata and settings required to configurate a development container for a given well-defined tool and runtime stack. It can be used by tools and services that support the dev container spec to create a development environment that contains one or more development containers.

The `devcontainer.json` file contains metadata that VSCode needs in order to access and use the container features after it's startup. The minimum required attributes are:

- `"image" : "path/to/container/registry/with/image"` <br>
The container image to use. [The devcontainer team provides unified base images for most purposes in the registry of this repo.](https://github.com/devcontainers/images). Images from third parties are just one web search away.

- `"remoteUser" : "vscode"` <br> The remote user that is configured on the container. With all most provided base containers, this is always `"vscode"`.

Additionally, the `devcontainer.json` usually contains the following attributes:

- `"features : {}"` <br> A JSON object that points to so called "devcontainer features". Features are self contained scripts, that add additional capabilities, such as software packages to a container. They are an alternative way over adding custom dockerfiles to add additional capabilities, such as installing software packages to a container. [The devcontainer project offers some in their repository.](https://github.com/devcontainers/features)

- `"customizations": {}` <br> A JSON object that holds so called "vendor specific extensions". While devcontainers are mostly used with VSCode today, the developers plan to extend support to other editors and IDE's as well. This object holds data that differs from editor to editor. **For VSCode, this is the place where the extensions that should be available in the container are defined (see example below).** [For more information, see the official docs.](https://containers.dev/supporting#visual-studio-code)


### Example configuration

todo: tba

## Adding new container images

todo: tba

