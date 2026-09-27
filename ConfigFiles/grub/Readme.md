# <p align="center"> 🎨 Tema para GRUB "HackTheBox" 🎨 </p>

<br>

### Vista previa:

<p align="center">
<img src="HackTheBox/background1_1024x768.png" width="400"><img src="HackTheBox/background3_1024x768.png" width="400">
<img src="HackTheBox/background2_1152x864.png" width="400"><img src="HackTheBox/background4_1152x864.png" width="400">
</p>
<br>

--------------------------------------------------
### Requisitos:

- Instala la versión más reciente de GRUB.
- Instala git para clonar el repositorio (o descarga el archivo comprimido desde el repositorio).
<br>

--------------------------------------------------
### Instrucciones de uso:

- Clone este repositorio con el comando:
```
git clone https://github.com/SrSancen/HTBGrubTheme.git ~/HTBGrubTheme
```

- Copie y pegue la carpeta del tema "HacktheBox", dentro de la carpeta /boot/grub/themes en su sistema, utilizando el siguiente comando:

```
sudo mv ~/HTBGrubTheme/HackTheBox /boot/grub/themes/
```
- Configura el tema de HackTheBox dentro del archivo grub, utilizando el siguiente comando:

```
sudo sed -i 's/^.*GRUB_THEME=.*$/GRUB_THEME="\/boot\/grub\/themes\/HackTheBox\/theme.txt"/' /etc/default/grub
```

- Modifica la resolución de la pantalla del Grub
```
sudo sed -i 's/GRUB_GFXMODE=auto/GRUB_GFXMODE=1024x768/' /etc/default/grub
```
- Dentro del tema existen varias imágenes, las cuales pueden seleccionar para configurarlas en el tema, para ello ejecutan el siguiente comando cambiando el nombre de la imagen que desean seleccionar: pej: "background1_1024x768.png".
```
sudo sed -i 's/^desktop-image: "background.*$/desktop-image: "background1_1024x768.png"/' /boot/grub/themes/HackTheBox/theme.txt
```
- En caso de que quieran cambiar la imagen solo deben modificar el nombre del archivo junto con la resolución correspondiente, usen el siguiente comando:
```
sudo sed -i 's/^desktop-image: "background.*$/desktop-image: "background2_1152x864.png"/' /boot/grub/themes/HackTheBox/theme.txt
```
- Hay que aplicar los cambios para que se vean reflejados en el siguiente arranque del sistema, pueden usar cualquiera de los 2 comandos siguientes:

- Comando 1:
```
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
- Comando 2:
```
update-grub
```
<br>

--------------------------------------------------
### Comentarios:

Si no funciona correctamente, instala grub-customizer para buscar errores en el uso del tema:

- Para distros como Arch Linux o Manjaro y sus variantes:
```
sudo pacman -S grub-customizer
```
- Luego verifique si hay algún problema en la configuración avanzada dentro de la aplicación grub-custizer.

<br>

--------------------------------------------------

### Errores comunes:

- No encuentra el archivo "theme.txt".
- Fondo de pantalla incorrecto.
- La resolución de la pantalla grub no es compatible.
<br>

--------------------------------------------------

### Para finalizar:

Reinicia la computadora para que se vean reflejados los cambios.