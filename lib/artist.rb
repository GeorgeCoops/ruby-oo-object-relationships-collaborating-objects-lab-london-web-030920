class Artist 

    attr_accessor :name 
    @@all = []

    def initialize(name)
        @name = name 
        @@all << self
    end

    def self.all 
        @@all
    end

    def songs 
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self 
    end

    def self.find_or_create_by_name(name)
        if !self.all.find { |artist| artist.name == name}
        self.new(name)
        end
        self.all.find { |artist| artist.name == name}
    end

        # artist = self.all.find {|artist| artist.name == name}
        # if artist
        #   artist
        # else
        #   new_artist = self.new(name)
        #   @@all << new_artist
        #   new_artist
        # end
  

    def print_songs
        songs.each {|song| puts song.name}
    end
end