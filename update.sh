#!/bin/bash

set -e

###
### update — Pull client LESS files down from the database and place them here
###
### Usage:
###   ./update.sh

PROD_ORGS=(
  1391 visa                        https://s3.amazonaws.com/watershed-files/css/1391-4bdc458a5b4716a84704d1fbccb9093a.less
  1591 behr_paint_company          https://watershed-files.s3.amazonaws.com/css/1591_rebrand_prod.less
  1721 halliburton                 https://watershed-files.s3.amazonaws.com/css/1721_rebrand_prod.less
  2681 caterpillar                 https://watershed-files.s3.amazonaws.com/css/2681_rebrand_prod.less
  3084 cathay_pacific              https://watershed-files.s3.amazonaws.com/css/3084_rebrand_prod.less
  3704 brian_floyd                 https://s3.amazonaws.com/watershed-files/css/3704-278f1a9c7dd1524756601269f645abed.less
  3841 stryker_eu                  https://s3.amazonaws.com/watershed-files/css/3841-e784f006b78e2e45719b0cbc34f3dec3.less
  4251 athenahealth_sandbox        https://watershed-files.s3.amazonaws.com/css/4251_rebrand_prod.less
  4811 athenahealth_live           https://watershed-files.s3.amazonaws.com/css/4811_rebrand_prod.less
  4833 tims_drama_box_mark_adams   https://watershed-files.s3.amazonaws.com/css/4833_rebrand_prod.less
  5641 stryker                     https://watershed-files.s3.amazonaws.com/css/5641_rebrand_prod.less
  5674 christus_health             https://watershed-files.s3.amazonaws.com/css/5674_rebrand_prod.less
  6305 royal_conservatory_of_music https://watershed-files.s3.amazonaws.com/css/6305_rebrand_prod.less
  7141 dell                        https://watershed-files.s3.amazonaws.com/css/7141_rebrand_prod.less
  12261 t-mobile                   https://s3.amazonaws.com/watershed-files/css/12261-bd7253bd2472a7e10de47971ff035ca3.less
)

SANDBOX_ORGS=(
  2331	halliburton_sandbox             https://watershed-files.s3.amazonaws.com/css/2331_rebrand_sandbox.less
  2601	gomo                            https://watershed-files.s3.amazonaws.com/css/2601_rebrand_sandbox.less
  3001	visa_university                 https://watershed-files.s3.amazonaws.com/css/3001_rebrand_sandbox.less
  3301	behr_paint_company              https://s3.amazonaws.com/watershed-files/css/3301-5948d99fc28c822fe9c355b760875bd1.less
  5611	booz_allen_hamilton             https://s3.amazonaws.com/watershed-files/css/5611-2a668d07d7c19b208b0088b354a89a79.less
  5633	peoplefluent_learning_presales  https://s3.amazonaws.com/watershed-files/css/5633-96ab54dc033a543105aaa5bcf23e2ee0.
  5701	usaf                            https://s3.amazonaws.com/watershed-files/css/5701-142d46436e8c5ebe2898599aab3702a0.less
  5791	healthstream                    https://s3.amazonaws.com/watershed-files/css/5791-a1b739d0d98b4766bad6371bfa243f85.less
  6402	stryker                         https://s3.amazonaws.com/watershed-files/css/6402-9df51b2ef02758d99e5e38fdac64bb04.less
  6471	christus_health                 https://watershed-files.s3.amazonaws.com/css/6471_rebrand_sandbox.less
  6701	the_royal_conservatory_of_music https://watershed-files.s3.amazonaws.com/css/6701_rebrand_sandbox.less
  6951	dell                            https://watershed-files.s3.amazonaws.com/css/6951_rebrand_sandbox.less
  7031	dxc_dev                         https://watershed-files.s3.amazonaws.com/css/7031_rebrand_sandbox.less
  7381	dxc_demo                        https://watershed-files.s3.amazonaws.com/css/7381_rebrand_sandbox.less
  8461	meridian_lms_sandbox            https://s3.amazonaws.com/watershed-files/css/8461-6e6a1b9bb6dc5e5e22fe55b8a57b63bb.less
  8503	intel_sandbox                   https://s3.amazonaws.com/watershed-files/css/8503-3bc70a5350f5834cdda0a033aff3c4cc.
  8551	airline_sandbox_internal        https://s3.amazonaws.com/watershed-files/css/8551-4a7f6ff231fb2f8970244fc458f7ad1d.
  8591	manufacturing_sandbox_internal  https://s3.amazonaws.com/watershed-files/css/8591-2691f091bd9811f62fd1b351eb6f9b8a.
  8621	amazon_sandbox                  https://s3.amazonaws.com/watershed-files/css/8621-61b7065af849edf472116aff28bfbcbc.
  8721	kaltura_demo_internal           https://s3.amazonaws.com/watershed-files/css/8721-986875cda2b1e120c845f4041c9cb02b.
  8722	scrimmage_analytics_demo_site   https://s3.amazonaws.com/watershed-files/css/8722-986875cda2b1e120c845f4041c9cb02b.
  8732	automotive_sandbox_internal     https://s3.amazonaws.com/watershed-files/css/8732-9b8a98ffa876ba4f5ad7851b5168b361.
  8741	finance_sandbox_internal        https://s3.amazonaws.com/watershed-files/css/8741-f0e0f875147da72f9cab4d459423498c.
  8752	novartis                        https://s3.amazonaws.com/watershed-files/css/8752-febdf99297ec04ed69d920f5230d9619.less
  8811	united_airlines_demo            https://s3.amazonaws.com/watershed-files/css/8811-4f173cf42d14b1cfc9569cef4ff638bc.
  8862	healthcare_sandbox_internal     https://s3.amazonaws.com/watershed-files/css/8862-8d660222e7408dd12ededff65bcc046c.
  8894	adp                             https://s3.amazonaws.com/watershed-files/css/8894-9debedd85085412205e069b84034cb6a.less
  8921	retail_sandbox_internal         https://s3.amazonaws.com/watershed-files/css/8921-e81a7f7dfdd0fca17f04b8910983ffb8.
  9031	bayer                           https://s3.amazonaws.com/watershed-files/css/9031-ed4e747be4cf3440374b5578800e2c3e.less
  9121	mars_dxc-zahra-ali              https://watershed-files.s3.amazonaws.com/css/9121_rebrand_sandbox.less
  9521	t-mobile                        https://s3.amazonaws.com/watershed-files/css/9521-264f9f21ec813047a00be9913af5372b.
)

EU_ORGS=(
  12	pwc_vantage_production https://watershed-files-eu.s3-eu-west-1.amazonaws.com/css/12_rebrand_eu.less
  61	jlr_sandbox            https://watershed-files-eu.s3-eu-west-1.amazonaws.com/css/61_rebrand_eu.less
  71	jlr                    https://watershed-files-eu.s3-eu-west-1.amazonaws.com/css/71_rebrand_eu.less
  131	fidelity               https://watershed-files-eu.s3-eu-west-1.amazonaws.com/css/131_rebrand_eu.less
  741	standard_bank          https://s3-eu-west-1.amazonaws.com/watershed-files-eu/css/741-76d80ab20121fcc38f056493d1279c43.
)

download_files() {
  FOLDER_NAME="$1"
  shift

  if [[ ! -d "$FOLDER_NAME" ]]; then
    mkdir $FOLDER_NAME
  fi

  ORGS=( "$@" )

  for i in "${!ORGS[@]}"; do
    # Assign values and pop values off array
    ID="${ORGS[i]}"
    [[ -z "$ID" ]] && break
    ORGS=("${ORGS[@]:1}")

    NAME="${ORGS[i]}"
    ORGS=("${ORGS[@]:1}")

    URL="${ORGS[i]}"

    printf "ID: $ID "
    printf "Name: $NAME "
    printf "Url: $URL\n"

    curl -s -XGET "$URL" -o ./${FOLDER_NAME}/${ID}_${NAME}.less
  done
}

download_files prod ${PROD_ORGS[@]}
download_files sandbox ${SANDBOX_ORGS[@]}
download_files eu ${EU_ORGS[@]}
