FROM ghcr.io/leejet/stable-diffusion.cpp:master-cuda

# Models are downloaded by the CI workflow into ./models before build
COPY models/ /models/