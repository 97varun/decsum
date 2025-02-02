#!/bin/bash
OUTPUT_DIR=../drive/MyDrive/ColabNotebooks/data/transformers
YELP_OUTPUT_DIR=../drive/MyDrive/ColabNotebooks/data # output dir of preprocessing step
DATA_DIR=${YELP_OUTPUT_DIR}/50reviews/
CACHE_DIR=../drive/MyDrive/ColabNotebooks/data/transformers_cache/

python -m models.transformers.main \
    --max_epochs 3 \
    --max_seq_length 3000 \
    --output_dir $OUTPUT_DIR \
    --data_dir $DATA_DIR \
    --model_name_or_path allenai/longformer-base-4096 \
    --warmup_steps 500 \
    --do_train \
    --cache_dir $CACHE_DIR \
    --fp16


