# platform = Red Hat Virtualization 4,multi_platform_ol,multi_platform_rhel,multi_platform_sle,multi_platform_slmicro5,multi_platform_almalinux

{{{ bash_instantiate_variables("var_accounts_fail_delay") }}}

{{{ bash_replace_or_append('/etc/login.defs', '^FAIL_DELAY', "$var_accounts_fail_delay", '%s %s') }}}
