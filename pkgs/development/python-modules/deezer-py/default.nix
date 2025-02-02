{ lib
, buildPythonPackage
, fetchPypi
, requests
, pythonOlder
}:

buildPythonPackage rec {
  pname = "deezer-py";
  version = "1.1.3";
  disabled = pythonOlder "3.6";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-FdLSJFALeGcecLAHk9khJTKlMd3Mec/w/PGQOHqxYMQ=";
  };

  propagatedBuildInputs = [ requests ];

  # Project has no tests
  doCheck = false;
  pythonImportsCheck = [ "requests" ];

  meta = with lib; {
    homepage = "https://gitlab.com/RemixDev/deezer-py";
    description = "A wrapper for all Deezer's APIs";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ natto1784 ];
  };
}
