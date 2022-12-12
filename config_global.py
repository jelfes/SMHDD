# in your own directory create file `config_local.py` in which you adjust the following varibles to your system
_data_path = "path/to/data/"

class helpers:
    def __init__(self) -> None:
        self.data_path = _data_path
        pass

    def get_data_path(self) -> str:
        return self.data_path