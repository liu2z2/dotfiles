#!/usr/bin/env python3
import json
from pathlib import Path

file_path = Path(__file__).resolve()
with open(str(file_path.parents[2] / "meta.json")) as f:
    config_dict = json.load(f)

linked_config_path = Path.home() / config_dict["config_path"] / "zsh" 
real_config_path = file_path.parents[0]

linked_config_path.symlink_to(real_config_path,
        target_is_directory=True)

linked_rc_path = Path.home() / ".zshrc"
real_rc_path = file_path.parents[0] / "zshrc"

linked_rc_path.symlink_to(real_rc_path)