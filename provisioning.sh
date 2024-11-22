#!/bin/bash

# original provisioning script from github.com/ai-dock/comfyui

# This provisioning script installs SDXL-lightning models from Huggingface:
# https://huggingface.co/ByteDance/SDXL-Lightning

# This file will be sourced in init.sh

# https://raw.githubusercontent.com/ai-dock/comfyui/main/config/provisioning/default.sh

# Packages are installed after nodes so we can fix them...

PYTHON_PACKAGES=(
    #"opencv-python==4.7.0.72"
)

NODES=(
	"https://github.com/ltdrdata/ComfyUI-Manager"
	"https://github.com/kijai/ComfyUI-SUPIR"
	"https://github.com/comfyanonymous/ComfyUI"
	"https://github.com/cubiq/ComfyUI_essentials"
	"https://github.com/ltdrdata/ComfyUI-Impact-Pack"
	"https://github.com/kijai/ComfyUI-KJNodes"
	"https://github.com/Acly/comfyui-inpaint-nodes"
	"https://github.com/chflame163/ComfyUI_LayerStyle"
	"https://github.com/WASasquatch/was-node-suite-comfyui/"
	"https://github.com/rgthree/rgthree-comfy"
	"https://github.com/crystian/ComfyUI-Crystools"
	"https://github.com/Hangover3832/ComfyUI-Hangover-Moondream"
	"https://github.com/Fannovel16/comfyui_controlnet_aux"
	"https://github.com/jags111/efficiency-nodes-comfyui"
	"https://github.com/yolain/ComfyUI-Easy-Use"
	"https://github.com/sipherxyz/comfyui-art-venture"
    "https://github.com/pemenu/comfyui_segment_anything"
    "https://github.com/pemenu/ComfyUI-WaterMark-Detector"
    
)

CHECKPOINT_MODELS=(
    "https://civitai.com/api/download/models/357609"
	"https://huggingface.co/ashleykleynhans/SUPIR/resolve/main/SUPIR-v0F.ckpt"

)

LORA_MODELS=(
    #"https://civitai.com/api/download/models/16576"
)

VAE_MODELS=(
    #"https://huggingface.co/stabilityai/sd-vae-ft-ema-original/resolve/main/vae-ft-ema-560000-ema-pruned.safetensors"
    #"https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors"
    #"https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors"
)

ESRGAN_MODELS=(
    #"https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x4.pth"
    #"https://huggingface.co/FacehugmanIII/4x_foolhardy_Remacri/resolve/main/4x_foolhardy_Remacri.pth"
    #"https://huggingface.co/Akumetsu971/SD_Anime_Futuristic_Armor/resolve/main/4x_NMKD-Siax_200k.pth"
)

CONTROLNET_MODELS=(
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_depth-fp16.safetensors"
    #"https://huggingface.co/kohya-ss/ControlNet-diff-modules/resolve/main/diff_control_sd15_depth_fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_hed-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_mlsd-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_normal-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_scribble-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_seg-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_color-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_depth-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_keypose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_seg-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_sketch-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_style-fp16.safetensors"
)

INPAINT_MODELS=(
    "https://github.com/Sanster/models/releases/download/add_mat/Places_512_FullData_G.pth"
)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    provisioning_print_header
    provisioning_get_nodes
    provisioning_install_python_packages
    provisioning_get_models \
        "/workspace/ComfyUI/models/checkpoints" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_models \
        "/workspace/ComfyUI/models/loras" \
        "${LORA_MODELS[@]}"
    provisioning_get_models \
        "/workspace/ComfyUI/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    provisioning_get_models \
        "/workspace/ComfyUI/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_models \
        "/workspace/ComfyUI/models/upscale_models" \
        "${ESRGAN_MODELS[@]}"
    provisioning_get_models \
        "/workspace/ComfyUI/models/inpaint" \
        "${INPAINT_MODELS[@]}"
    provisioning_print_end
}

function provisioning_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="/opt/ComfyUI/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                    micromamba -n comfyui run ${PIP_INSTALL} -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                micromamba -n comfyui run ${PIP_INSTALL} -r "${requirements}"
            fi
        fi
    done
}

function provisioning_install_python_packages() {
    if [ ${#PYTHON_PACKAGES[@]} -gt 0 ]; then
        micromamba -n comfyui run ${PIP_INSTALL} ${PYTHON_PACKAGES[*]}
    fi
}

function provisioning_get_models() {
    if [[ -z $2 ]]; then return 1; fi
    dir="$1"
    mkdir -p "$dir"
    shift
    arr=("$@")
    
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        provisioning_download "${url}" "${dir}"
        printf "\n"
    done
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Web UI will start now\n\n"
}

# Download from $1 URL to $2 file path
function provisioning_download() {
    wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
}

provisioning_start