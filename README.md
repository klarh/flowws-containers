# Overview

This repository contains docker recipes to build a
[flowws](https://flowws.readthedocs.io) image that can be used for
simulation, visualization, and analysis. It is based on the
infrastructure provided in the
[plato-containers](https://github.com/glotzerlab/plato-containers/tree/master/plato-live)
project.

## Examples

Browse sample structures and their bond orientational order diagrams
from [pyriodic](https://pyriodic.readthedocs.io):

```
docker run -p 5400:5400 --rm mspells/flowws-live:latest novnc python -m flowws.run Pyriodic --structure cF4-Cu --size 1024 --noise 1e-2 SmoothBOD Plato ViewQt
# now open http://localhost:5400/?resize=remote in your browser
```

View a trajectory file (`trajectory.gsd`) found on the host
filesystem:

```
docker run -p 5400:5400 --rm --mount type=bind,dst=/home/user/work,src="$(pwd)" mspells/flowws-live:latest novnc python -m flowws.run Garnett --filename trajectory.gsd RDF --r-max 2 Steinhardt --r-max 2 SmoothBOD Colormap Plato ViewQt
# now open http://localhost:5400/?resize=remote in your browser
```

Open a jupyter notebook with example repositories:

```
docker run -p 8888:8888 --rm mspells/flowws-live:latest notebook
# now open http://localhost:8888 in your browser
```