#!/usr/bin/env python3
import yaml
import argparse

def load_yaml_to_array(file_path):
    """
    Loads a YAML file and returns its contents as a Python array/list,
    preserving strings as single elements.
    
    Args:
        file_path (str): Path to the YAML file
        
    Returns:
        list: Contents of the YAML file as a Python list
        
    Raises:
        FileNotFoundError: If the specified file doesn't exist
        yaml.YAMLError: If the YAML file is invalid
    """
    try:
        # Open and read the YAML file
        with open(file_path, 'r') as file:
            # Load YAML content into a Python data structure
            data = yaml.safe_load(file)
            
            # If data is already a list, return it
            if isinstance(data, list):
                return data
            # If data is None (empty file), return empty list
            elif data is None:
                return []
            # If data is any other type (including string), wrap it in a list
            else:
                return [data]
                
    except FileNotFoundError:
        raise FileNotFoundError(f"The file {file_path} was not found.")
    except yaml.YAMLError as e:
        raise yaml.YAMLError(f"Error parsing YAML file: {str(e)}")

def main():
    """Main function to handle command line arguments and process YAML file."""
    # Set up argument parser
    parser = argparse.ArgumentParser(
        description="Load a YAML file and convert it to a Python array"
    )
    parser.add_argument(
        "yaml_file",
        help="Path to the YAML file to process"
    )
    parser.add_argument(
        "-o", "--output",
        help="Optional output file to save the result (prints to console if not specified)",
        default=None
    )

    # Parse arguments
    args = parser.parse_args()

    try:
        # Load the YAML file
        result = load_yaml_to_array(args.yaml_file)
        
        # Handle output
        if args.output:
            with open(args.output, 'w') as f:
                f.write(str(result))
            print(f"Result saved to {args.output}")
        else:
            print(result)
            
    except Exception as e:
        print(f"An error occurred: {str(e)}")
        exit(1)

if __name__ == "__main__":
    main()