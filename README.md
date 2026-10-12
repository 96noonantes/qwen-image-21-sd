# qwen-image-21-sd

Qwen Image 2.1 sd-server container image with models baked in, for SaladCloud GPU deployment.

- Base: `ghcr.io/leejet/stable-diffusion.cpp:master-cuda`
- Models (baked into image at `/models/`):
  - `dit.gguf` — Qwen-Image-2.1-Turbo-AD-Q5_K
  - `enc.gguf` — Qwen-Image-2.1-Turbo-Abliterated-Uncensored-AD-Q5_K
  - `vae.safetensors` — Qwen Image 2.1 VAE bf16

## Usage on SaladCloud

Container command (no model download needed):

```bash
exec /sd-server --diffusion-model /models/dit.gguf --llm /models/enc.gguf \
  --vae /models/vae.safetensors --fa --auto-fit on \
  --listen-ip :: --listen-port 8080
```

## Build locally

```bash
mkdir -p models
curl -L -o models/dit.gguf "$DIT_URL" &
curl -L -o models/enc.gguf "$ENC_URL" &
curl -L -o models/vae.safetensors "$VAE_URL" &
wait
docker build -t ghcr.io/96noonantes/qwen-image-21-sd:latest .
```