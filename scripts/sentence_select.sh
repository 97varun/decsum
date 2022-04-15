#!/bin/bash
set -x

OUTPUT_DIR=../drive/MyDrive/ColabNotebooks/data
MODEL_PATH=${OUTPUT_DIR}/transformers/version_27-12-2021--16-59-15/checkpoints/epoch=1-val_loss=0.12.ckpt
RES_DIR=${OUTPUT_DIR}/models/sentence_select/

# DecSum
for m in Transformer # 
do
    for s in  window_1_DecSum_WD_sentbert #
    do
        for d in yelp # 
        do
            for k in 50trunc #10 # 5
            do
                # add hyperparameter search here
                for alpha in  1  
                do
                    for beta in 1  
                    do
                        for gamma in 1 
                        do 
                            (python -m models.sentence_select.main \
                                    --device 0 --feature_used notes \
                                    --trained_model_path ${MODEL_PATH} \
                                    --result_dir ${RES_DIR} \
                                    --data_dir ${OUTPUT_DIR} \
                                    --num_sentences $k \
                                    --alpha $alpha \
                                    --beta $beta \
                                    --gamma $gamma \
                                    --segment $s\_$k\_$alpha\_$beta\_$gamma \
                                    --model $m \
                                    --data $d \
                                    --num_review 50 \
                                    --target_type reg )
                        done
                    done
                done
            done
        done
    done
done
