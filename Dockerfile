FROM ghcr.io/leejet/stable-diffusion.cpp:master-cuda

# Models are downloaded inside the build (not via build context) to keep
# runner disk usage low, then baked into the image layer.
ARG DIT_URL
ARG ENC_URL
ARG VAE_URL
ARG MM_PROJ_URL

RUN apt-get update && apt-get install -y --no-install-recommends curl \
    && mkdir -p /models \
    && curl -sL --retry 3 --fail -o /models/dit.gguf "$DIT_URL" \
    && curl -sL --retry 3 --fail -o /models/enc.gguf "$ENC_URL" \
    && curl -sL --retry 3 --fail -o /models/vae.safetensors "$VAE_URL" \
    && curl -sL --retry 3 --fail -o /models/mmproj.gguf "$MM_PROJ_URL" \
    && rm -rf /var/lib/apt/lists/* \
    && ls -la /models