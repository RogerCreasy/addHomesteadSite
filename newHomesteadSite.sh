#!/usr/bin/env bash

echo "Type the name of your new site followed by [Enter]:";

read SITE;

echo "Type the IP address of your Homestead server followed by [Enter]:"

read IP

echo $SITE " will be added to your hosts file and directed to: "$IP;
echo "OK? [y/n]";
read CONFIRM;

if [[ "$CONFIRM" == "y" ]]; then
  NEWLINE="$IP     $SITE\n";
  echo $NEWLINE;
  sed -i "/# Homestead/,/^$/s/^$/$NEWLINE/" /etc/hosts

  TO="  - map: $SITE \n  to: /home/vagrant/Code/$SITE/public";
  echo $TO;
  sed -i "/sites:/,/^$/s/^$/$TO/" ~/.homestead/Homestead.yaml
fi