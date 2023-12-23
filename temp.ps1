import subprocess
import os


executable_path = os.path.abspath("FastExecutable.exe")

# Crear el script PowerShell en una cadena
powershell_script = f'''
$rutaArchivo = "{executable_path}"
$nombreAccesoDirecto = "FastExecutable"
$rutaAccesoDirecto = [System.IO.Path]::Combine([System.Environment]::GetFolderPath("Desktop"), "$nombreAccesoDirecto.lnk")
$objShell = New-Object -ComObject WScript.Shell
$objShortcut = $objShell.CreateShortcut($rutaAccesoDirecto)
$objShortcut.TargetPath = $rutaArchivo
$objShortcut.Save()
'''

# Guardar el script en un archivo temporal
powershell_file = "temp.ps1"
with open(powershell_file, "w") as file:
    file.write(powershell_script)

# Ejecutar el script PowerShell
subprocess.run(["powershell.exe", "-ExecutionPolicy", "Unrestricted", f".\\{powershell_file}"])

# Eliminar el archivo temporal
os.remove(powershell_file)
