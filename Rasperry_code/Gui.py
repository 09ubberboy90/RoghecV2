#!/usr/bin/env python3



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
import custom_threads

class Menu(pygubu.TkApplication):
    def _create_ui(self):

        # 1: Create a builder
        self.builder = builder = pygubu.Builder()

        # 2: Load an ui file
        builder.add_from_file('/home/ubberboy/Documents/RoghecV2/snowboy/gui.ui')

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
        builder.add_from_file('/home/ubberboy/Documents/RoghecV2/snowboy/gui.ui')

        # 3: Create the widget using a master as parent
        self.webcam_window = builder.get_object('webcam', self.master)
        self.canvas = builder.get_object('Label_Image')
        # self.on_build()
        self.master.protocol("WM_DELETE_WINDOW", self.on_close_window)
        builder.connect_callbacks(self)
        self.master.columnconfigure(0, weight=1)
        self.set_resizable()

        self.x = custom_threads.thread_with_trace(target=self.on_build, daemon = True)
        self.x.start()

    def on_close_window(self, event=None):
        print('On close window')

        # Call destroy on toplevel to finish program
        self.stop()
        
    def stop(self):
        self.stop_thread = True
        self.x.kill()
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
        builder.add_from_file('/home/ubberboy/Documents/RoghecV2/snowboy/gui.ui')

        # 3: Create the widget using a master as parent
        self.helper_window = builder.get_object('helper', self.master)
        self.master.protocol("WM_DELETE_WINDOW", self.on_close_window)
        self.text_1 = builder.get_object("me_said")
        self.text_2 = builder.get_object("me_text")
        self.text_3 = builder.get_object("you_said")
        self.text_4 = builder.get_object("google_said")
        self.text_5 = builder.get_object("state")

        self.texts = [self.text_1,self.text_2,self.text_3,self.text_4,self.text_5]
        self.image = builder.get_object("Label_Google")
        img = Image.open("/home/ubberboy/Documents/RoghecV2/snowboy/logo.gif")
        img = img.resize((100,100), Image.ANTIALIAS)
        photo =  ImageTk.PhotoImage(img)
        self.image.config(image = photo)
        self.image.image = photo

        builder.connect_callbacks(self)
        self.set_resizable()

        self.x = custom_threads.thread_with_trace(target=self.on_build, daemon = True)
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
        c = self.texts
        demo2.init(c, lambda: self.stop_thread)


if __name__ == '__main__':
    root = tk.Tk()
    root.attributes('-zoomed', True)
    app = Menu(root)

    root.mainloop()
