import tkinter as tk
import pygubu
import webcam
import threading
import demo2
import multiprocessing
import sys 
import trace 
import time
from PIL import Image
from PIL import ImageTk

class thread_with_trace(threading.Thread):
    def __init__(self, *args, **keywords):
        threading.Thread.__init__(self, *args, **keywords)
        self.killed = False

    def start(self):
        self.__run_backup = self.run
        self.run = self.__run
        threading.Thread.start(self)

    def __run(self):
        sys.settrace(self.globaltrace)
        self.__run_backup()
        self.run = self.__run_backup

    def globaltrace(self, frame, event, arg):
        if event == 'call':
            return self.localtrace
        else:
            return None

    def localtrace(self, frame, event, arg):
        if self.killed:
            if event == 'line':
                raise SystemExit()

        return self.localtrace

    def kill(self):
        self.killed = True


class Menu(pygubu.TkApplication):
    def _create_ui(self):

        # 1: Create a builder
        self.builder = builder = pygubu.Builder()

        # 2: Load an ui file
        builder.add_from_file('gui.ui')

        # 3: Create the widget using a master as parent
        self.main_window = builder.get_object('main_menu', self.master)
        builder.connect_callbacks(self)

        self.master.protocol("WM_DELETE_WINDOW", self.on_close_window)
        self.set_resizable()

    def on_close_window(self, event=None):
        print('On close window')

        # Call destroy on toplevel to finish program
        self.main_window.master.destroy()

    def helper(self):
        self.main_window.master.destroy()
        root = tk.Tk()
        root.attributes('-zoomed', True)
        helper = Helper(root)
        root.mainloop()

    def webcam(self):
        self.main_window.master.destroy()
        root = tk.Tk()
        root.attributes('-zoomed', True)

        webcam = Webcam(root)
        root.mainloop()


class Webcam(pygubu.TkApplication):
    def _create_ui(self):

        # 1: Create a builder
        self.builder = builder = pygubu.Builder()
        self.stop_thread = False
        # 2: Load an ui file
        builder.add_from_file('gui.ui')

        # 3: Create the widget using a master as parent
        self.webcam_window = builder.get_object('webcam', self.master)
        self.canvas = builder.get_object('Label_Image')
        # self.on_build()
        self.master.protocol("WM_DELETE_WINDOW", self.on_close_window)
        builder.connect_callbacks(self)
        self.master.columnconfigure(0, weight=1)
        self.set_resizable()

        self.x = threading.Thread(target=self.on_build)
        self.x.start()

    def on_close_window(self, event=None):
        print('On close window')

        # Call destroy on toplevel to finish program
        self.stop()
        
    def stop(self):
        self.stop_thread = True
        self.x.join()
        self.webcam_window.master.destroy()

    def menu(self):
        self.stop()
        root = tk.Tk()
        root.attributes('-zoomed', True)

        menu = Menu(root)
        root.mainloop()

    def on_build(self):
        c = self.canvas
        webcam.init(c, lambda: self.stop_thread)


class Helper(pygubu.TkApplication):
    def _create_ui(self):

        # 1: Create a builder
        self.builder = builder = pygubu.Builder()
        self.stop_thread = False
        # 2: Load an ui file
        builder.add_from_file('gui.ui')

        # 3: Create the widget using a master as parent
        self.helper_window = builder.get_object('helper', self.master)
        self.master.protocol("WM_DELETE_WINDOW", self.on_close_window)
        self.text = builder.get_object("Label_6")
        self.image = builder.get_object("Label_Google")
        img = Image.open("logo.gif")
        img = img.resize((100,100), Image.ANTIALIAS)
        photo =  ImageTk.PhotoImage(img)
        self.image.config(image = photo)
        self.image.image = photo

        builder.connect_callbacks(self)
        self.set_resizable()

        self.x = thread_with_trace(target=self.on_build)
        self.x.start()

    def on_close_window(self, event=None):
        print('On close window')
        # Call destroy on toplevel to finish program
        self.stop()
    def stop(self):
        self.stop_thread = True
        self.x.kill()
        self.x.join()
        self.helper_window.master.destroy()

    def menu(self):
        self.stop()
        root = tk.Tk()
        root.attributes('-zoomed', True)

        menu = Menu(root)
        root.mainloop()

    def on_build(self):
        c = self.text
        demo2.init(c, lambda: self.stop_thread)


if __name__ == '__main__':
    root = tk.Tk()
    root.attributes('-zoomed', True)
    app = Menu(root)

    root.mainloop()
