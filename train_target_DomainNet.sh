SRC_DOMAIN=$1
TGT_DOMAIN=$2
SRC_MODEL_DIR=$3

PORT=10000
MEMO="target"

for SEED in 2022
do
    python main_csfda.py \
    seed=${SEED} port=${PORT} memo=${MEMO} project="domainnet-126" \
    data.data_root="${PWD}/data" data.workers=8 \
    data.dataset="domainnet-126" data.source_domains="[${SRC_DOMAIN}]" data.target_domains="[${TGT_DOMAIN}]" \
    model_src.arch="resnet50" \
    model_tta.src_log_dir=${SRC_MODEL_DIR} \
    optim.lr=2e-4
done
