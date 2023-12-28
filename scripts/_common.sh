#!/bin/bash

#=================================================
# RETRIEVE ARGUMENTS FROM THE MANIFEST
#=================================================

# Transfer the main SSO domain to the App:
ynh_current_host=$(cat /etc/yunohost/current_host)
__YNH_CURRENT_HOST__=${ynh_current_host}

#=================================================
# ARGUMENTS FROM CONFIG PANEL
#=================================================

# 'debug_enabled' -> '__DEBUG_ENABLED__' -> settings.DEBUG
debug_enabled="0" # "1" or "0" string

# 'log_level' -> '__LOG_LEVEL__' -> settings.LOG_LEVEL
log_level="WARNING"

# 'admin_email' -> '__ADMIN_EMAIL__' add in settings.ADMINS
admin_email="${admin}@${domain}"

# 'default_from_email' -> '__DEFAULT_FROM_EMAIL__' -> settings.DEFAULT_FROM_EMAIL
default_from_email="${app}@${domain}"

#=================================================
# HELPERS
#=================================================

myynh_fix_file_permissions() {
    (
        set -x

        # /var/www/$app/
        chown -c -R "$app:www-data" "$install_dir"
        chmod -c o-rwx "$install_dir"

        # /home/yunohost.app/$app/
        chown -c -R "$app:" "$data_dir"
        chmod -c o-rwx "$data_dir"
    )
}
