#!/bin/bash

dotnet restore
dotnet publish -c $BUILD_CONFIGURATION