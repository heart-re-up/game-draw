# ##################################################
# 먼저 의존성 모듈을 설치합니다.
# ##################################################

# eslint
ESLINT="eslint eslint-config-next"
PRETTIER="prettier eslint-config-prettier eslint-plugin-prettier"
AIRBNB="eslint-config-airbnb eslint-config-airbnb-typescript"
# prettier
echo "pnpm add -D $ESLINT $PRETTIER $AIRBNB"
pnpm add -D $ESLINT $PRETTIER $AIRBNB

##################################################
# 설정이 구성되어 있지 않은 경우 설정을 구성합니다.
##################################################

ESLINTRC=.eslintrc.json

if [ -f "$ESLINTRC" ] ;then
  SUFFIX=$(date +%Y%m%d-%H%M%S)
  NEW_FILE_NAME="$ESLINTRC.$SUFFIX"
  echo "이미 존재하는 $ESLINTRC 파일이 발견되어 $NEW_FILE_NAME 으로 백업합니다."
  cp "$ESLINTRC" "$NEW_FILE_NAME"
fi

echo '{"env": {"browser": true, "es2021": true, "node": true}, "settings": {"import/resolver": {"node": {"extensions": [".js", ".jsx", ".ts", ".tsx"]}}}, "extends": ["prettier", "airbnb", "airbnb/hooks", "airbnb-typescript", "eslint:recommended", "plugin:react/recommended", "plugin:prettier/recommended", "plugin:@typescript-eslint/recommended"], "parser": "@typescript-eslint/parser", "parserOptions": {"ecmaVersion": "latest", "sourceType": "module", "project": "./tsconfig.json"}, "plugins": ["@typescript-eslint", "react", "prettier"], "rules": {"prettier/prettier": "error", "import/extensions": "off", "react/react-in-jsx-scope": "off", "react/require-default-props": "off", "import/no-extraneous-dependencies": "off"}}' | jq -r . > "$ESLINTRC"
