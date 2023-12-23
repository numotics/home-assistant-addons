#!/usr/bin/with-contenv bashio
set -e

CONFIG_PATH=/data/options.json

python3 -m wyoming_openai_audio_api \
    --uri 'tcp://0.0.0.0:10300' --model $(jq --raw-output ".model" $CONFIG_PATH) --language $(jq --raw-output ".model_lang" $CONFIG_PATH) --api-key $(jq --raw-output ".openai_key" $CONFIG_PATH)