# ##################################################
# 먼저 의존성 모듈을 설치합니다.
# ##################################################

# jest
PACKAGES="jest ts-jest @types/jest"
echo "pnpm add -D $PACKAGES"
pnpm add -D $PACKAGES

##################################################
# 설정이 구성되어 있지 않은 경우 설정을 구성합니다.
##################################################

CONFIGFILE=jest.config.js

if [ -f "$CONFIGFILE" ] ;then
  SUFFIX=$(date +%Y%m%d-%H%M%S)
  NEW_FILE_NAME="$CONFIGFILE.$SUFFIX"
  echo "이미 존재하는 $CONFIGFILE 파일이 발견되어 $NEW_FILE_NAME 으로 백업합니다."
  cp "$CONFIGFILE" "$NEW_FILE_NAME"
fi

mkdir tests
echo "
module.exports = {
    preset: 'ts-jest',
    testEnvironment: 'node'
}
" > "$CONFIGFILE"
