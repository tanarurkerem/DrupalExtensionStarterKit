base_url=$(cat behat.yml | grep base_url | sed -e "s/[ ]*base_url:[ ]*//")
read -e -p "Your Base URL (default: $base_url): " new_base_url
if [ -n "$new_base_url" ]; then
  sed -i'.bak' -e "s!$base_url!$new_base_url!g" behat.yml
  rm behat.yml.bak
fi

read -p "Run tests from webserver and use Drupal API driver? (y/n):" yesorno
  case "$yesorno" in
     y*)
          drupal_root=$(cat behat.yml | grep drupal_root | sed -e "s/[ ]*drupal_root:[ ]*//")
          sed -i'.bak' -e "s/#api_driver/ api_driver/" behat.yml
          sed -i'.bak' -e "s/#drupal:/ drupal:/" behat.yml
          sed -i'.bak' -e "s/#drupal_root/ drupal_root/" behat.yml
          read -e -p "Your Drupal root (default: $drupal_root): " new_drupal_root
            if [ -n "$new_drupal_root" ]; then
              sed -i'.bak' -e "s!$drupal_root!$new_drupal_root!g" behat.yml
            fi
          rm behat.yml.bak ;;
     n*)  sed -i'.bak' -e "s/ api_driver/#api_driver/" behat.yml
          sed -i'.bak' -e "s/ drupal:/#drupal:/" behat.yml
          sed -i'.bak' -e "s/ drupal_root/#drupal_root/" behat.yml
         rm behat.yml.bak ;;
  esac
