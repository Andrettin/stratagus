//       _________ __                 __
//      /   _____//  |_____________ _/  |______     ____  __ __  ______
//      \_____  \\   __\_  __ \__  \\   __\__  \   / ___\|  |  \/  ___/
//      /        \|  |  |  | \// __ \|  |  / __ \_/ /_/  >  |  /\___ |
//     /_______  /|__|  |__|  (____  /__| (____  /\___  /|____//____  >
//             \/                  \/          \//_____/            \/
//  ______________________                           ______________________
//                        T H E   W A R   B E G I N S
//         Stratagus - A free fantasy real time strategy game engine
//
/**@name movie.h - The movie header file. */
//
//      (c) Copyright 2002-2005 by Lutz Sammer
//
//      This program is free software; you can redistribute it and/or modify
//      it under the terms of the GNU General Public License as published by
//      the Free Software Foundation; only version 2 of the License.
//
//      This program is distributed in the hope that it will be useful,
//      but WITHOUT ANY WARRANTY; without even the implied warranty of
//      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//      GNU General Public License for more details.
//
//      You should have received a copy of the GNU General Public License
//      along with this program; if not, write to the Free Software
//      Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
//      02111-1307, USA.
//

#ifndef __MOVIE_H__
#define __MOVIE_H__

//@{

#include <SDL.h>
#include <guichan.hpp>
#include <guichan/sdl/sdlimage.hpp>

#ifdef USE_VORBIS

/*----------------------------------------------------------------------------
--  Documentation
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
--  Includes
----------------------------------------------------------------------------*/

#include "ogg/ogg.h"
#include "vorbis/codec.h"
#ifdef USE_THEORA
#include "theora/theora.h"
#endif

/*----------------------------------------------------------------------------
--  Declarations
----------------------------------------------------------------------------*/

class CFile;

/**
**  Ogg data structure to handle vorbis/theora streaming.
*/
struct OggData {
	CFile *File;      /// Ogg file handle
	ogg_sync_state sync;
	ogg_page page;

	ogg_stream_state astream;
	vorbis_info vinfo;
	vorbis_comment vcomment;
	vorbis_block vblock;
	vorbis_dsp_state vdsp;

#ifdef USE_THEORA
	ogg_stream_state vstream;
	theora_info tinfo;
	theora_comment tcomment;
	theora_state tstate;
#endif

	int audio : 1;
#ifdef USE_THEORA
	int video : 1;
#endif
};

#ifdef USE_THEORA
class Movie : public gcn::SDLImage
{
public:
	Movie() : gcn::SDLImage(nullptr, false) {}
	~Movie();
	bool Load(const std::string &filename, int w, int h);
	bool IsPlaying() const { return true; }

	// guichan
	SDL_Surface *getSurface() const override;

public:
	CFile *f = nullptr;
	mutable bool need_data = true;
	mutable Uint32 start_time = 0;
	mutable OggData *data = nullptr;
	mutable SDL_Rect *rect = nullptr;
	mutable SDL_Texture *yuv_overlay = nullptr;
};
#endif

/*----------------------------------------------------------------------------
--  Variables
----------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------
--  Functions
----------------------------------------------------------------------------*/

extern int OggInit(CFile *f, OggData *data);
extern void OggFree(OggData *data);
extern int OggGetNextPage(ogg_page *page, ogg_sync_state *sync, CFile *f);

extern int VorbisProcessData(OggData *data, char *buffer);

#endif // USE_VORBIS

#if !defined(USE_THEORA) || !defined(USE_VORBIS)
/// empty class for lua scripts
class Movie : public gcn::Image
{
public:
	Movie() {}
	~Movie() {}
	bool Load(const std::string &filename, int w, int h) { return false; }
	bool IsPlaying() const { return false; }

	// guichan
	int getWidth() const override { return 0; }
	int getHeight() const override { return 0; }
	void free() override { throw "unimplemented"; };
	gcn::Color getPixel(int, int) override { throw "unimplemented"; };
	void putPixel(int, int, const gcn::Color &) override { throw "unimplemented"; };
	void convertToDisplayFormat() override { throw "unimplemented"; };
};
#endif

/// Play a movie file
extern int PlayMovie(const std::string &name);

//@}

#endif // !__MOVIE_H__
