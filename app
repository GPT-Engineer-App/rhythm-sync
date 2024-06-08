import tkinter as tk
from tkinter import filedialog
from pygame import mixer

class MusicPlayer:
    def __init__(self, root):
        self.root = root
        self.root.title("Music Player")
        self.root.geometry("300x200")

        mixer.init()

        self.current_song = None

        self.play_button = tk.Button(self.root, text="Play", command=self.play_music)
        self.play_button.pack(pady=10)

        self.pause_button = tk.Button(self.root, text="Pause", command=self.pause_music)
        self.pause_button.pack(pady=10)

        self.stop_button = tk.Button(self.root, text="Stop", command=self.stop_music)
        self.stop_button.pack(pady=10)

        self.load_button = tk.Button(self.root, text="Load", command=self.load_music)
        self.load_button.pack(pady=10)

    def play_music(self):
        if self.current_song:
            mixer.music.play()

    def pause_music(self):
        if self.current_song:
            mixer.music.pause()

    def stop_music(self):
        if self.current_song:
            mixer.music.stop()

    def load_music(self):
        self.current_song = filedialog.askopenfilename(filetypes=[("MP3 files", "*.mp3")])
        if self.current_song:
            mixer.music.load(self.current_song)

if __name__ == "__main__":
    root = tk.Tk()
    app = MusicPlayer(root)
    root.mainloop()