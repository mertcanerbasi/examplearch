import re
from ruamel.yaml import YAML

def increment_version(version):
    """Increments both version and build number by 1."""
    # Assuming version format is 'x.y.z+build'
    version_regex = r'(\d+)\.(\d+)\.(\d+)\+(\d+)'
    match = re.match(version_regex, version)
    if not match:
        raise ValueError("Invalid version format. Expected format 'x.y.z+build'")

    major, minor, patch, build = map(int, match.groups())
    # Increment the patch version and build number by 1
    patch += 1
    build += 1
    return f"{major}.{minor}.{patch}+{build}"

def update_pubspec_version(pubspec_path):
    """Updates the version in the pubspec.yaml file."""
    yaml = YAML()

    # Load the pubspec.yaml file
    with open(pubspec_path, 'r') as file:
        data = yaml.load(file)

    # Get the current version and increment it
    current_version = data.get('version', '1.0.0+1')
    new_version = increment_version(current_version)
    data['version'] = new_version

    # Save the updated file
    with open(pubspec_path, 'w') as file:
        yaml.dump(data, file)

    print(f"Version updated from {current_version} to {new_version}")

# Path to your pubspec.yaml file
pubspec_file_path = 'pubspec.yaml'
update_pubspec_version(pubspec_file_path)
