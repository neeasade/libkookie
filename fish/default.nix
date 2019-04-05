
{ pkgs }:
''
set fish_function_path ${pkgs.fish-foreign-env}/share/fish-foreign-env/functions $fish_function_path


${builtins.readFile ./functions/__fancy_history.fish }

${builtins.readFile ./config.fish }
${builtins.readFile ./alias.fish }

${builtins.readFile ./functions/fish_prompt.fish }
${builtins.readFile ./functions/fish_right_prompt.fish }
${builtins.readFile ./functions/k.fish }
${builtins.readFile ./functions/restart.fish }
${builtins.readFile ./functions/rvm.fish }
${builtins.readFile ./functions/fish_user_key_bindings.fish }
${builtins.readFile ./functions/__history_previous_command_arguments.fish }
${builtins.readFile ./functions/__history_previous_command.fish }
${builtins.readFile ./functions/__skim_cd.fish }
${builtins.readFile ./functions/__kakoune.fish }
${builtins.readFile ./functions/search.fish }

${builtins.readFile ./binds.fish}
''
