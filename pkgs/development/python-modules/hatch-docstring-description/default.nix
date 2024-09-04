{
  lib,
  buildPythonPackage,
  fetchPypi,
  pytestCheckHook,
  pythonOlder,
  build,
  hatchling,
  hatch-vcs,
  tomli,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "hatch-docstring-description";
  version = "1.0.2";
  format = "pyproject";

  disabled = pythonOlder "3.7";

  src = fetchPypi {
    pname = "hatch_docstring_description";
    inherit version;
    hash = "sha256-oh2jmRECOjrwpex7Jmg5MRF3a0IHWOie7cNOzQe6Sv0=";
  };

  nativeBuildInputs = [ hatchling ];
  buildInputs = [ hatch-vcs ];

  propagatedBuildInputs = [ hatchling ];

  nativeCheckInputs = [
    build
    pytestCheckHook
  ];

  # Requires network connection
  disabledTests = [ "test_no_package_error" ];

  pythonImportsCheck = [ "hatch_docstring_description" ];

  meta = with lib; {
    description = "Dynamic descriptions in pyproject.toml";
    mainProgram = "hatch-docstring-description";
    homepage = "https://github.com/flying-sheep/hatch-docstring-description";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ tprime ];
  };
}
