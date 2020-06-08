from setuptools import setup


requires = [
    "flask",
    "flask-restplus",
    "pathlib",
    "xmljson",
    "requests",
    "gunicorn",
    "Werkzeug==0.16.1"
]
extras = {
    "test": ["pytest", "pytest-flask", "pytest-dependency", "pytest-mock"]
}

setup(name='flask-api',
      version='0.1',
      description='Flask API',
      author='Benno Lin',
      author_email='blueworrybear@gmail.com',
      license='MIT',
      packages=[],
      scripts=[],
      include_package_data=True,
      install_requires=requires,
      extras_require=extras,
      zip_safe=False)
