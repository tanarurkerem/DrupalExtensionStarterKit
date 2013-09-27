base_url=$(cat behat.yml | grep base_url | sed -e "s/[ ]*base_url:[ ]*//")
read -e -p "Your Base URL (default: $base_url): " new_base_url
if [ -n "$new_base_url" ]; then
  sed -i .bak -e "s!$base_url!$new_base_url!g" behat.yml
  rm behat.yml.bak
fi

drupal_root=$(cat behat.yml | grep drupal_root | sed -e "s/[ ]*drupal_root:[ ]*//")
read -e -p "Your Drupal root (default: $drupal_root): " new_drupal_root
if [ -n "$new_drupal_root" ]; then
  sed -i .bak -e "s!$drupal_root!$new_drupal_root!g" behat.yml
  rm behat.yml.bak
fi
