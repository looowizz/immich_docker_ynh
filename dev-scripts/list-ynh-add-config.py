#!/usr/bin/env python3


from pathlib import Path


def main():
    base_path = Path(__file__).parent.parent
    conf_path = base_path / 'conf'

    print('-'*100)
    for file_path in sorted(conf_path.glob('*')):
        print(f'ynh_add_config --template="{file_path.name}" --destination="$data_dir/{file_path.name}"')
    print('-' * 100)


if __name__ == '__main__':
    main()
