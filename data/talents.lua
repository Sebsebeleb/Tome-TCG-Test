-- ToME - Tales of Middle-Earth
-- Copyright (C) 2009, 2010, 2011, 2012, 2013 Nicolas Casalini
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
-- Nicolas Casalini "DarkGod"
-- darkgod@te4.org

newTalentType{ type="role/combat", name = "combat", description = "Combat techniques" }

newTalent{
	name = "Kick",
	type = {"role/combat", 1},
	points = 1,
	cooldown = 6,
	power = 2,
	range = 1,
	action = function(self, t)
		--local tg = {type="hit", range=self:getTalentRange(t)}
		--local x, y, target = self:getTarget(tg)
		--if not x or not y or not target then return nil end
		--if core.fov.distance(self.x, self.y, x, y) > 1 then return nil end

		--target:knockback(self.x, self.y, 2 + self:getDex())
		game.log("I used test talent")
		return true
	end,
	info = function(self, t)
		return "Kick!"
	end,
}

newTalent{
	name = "Acid Spray",
	type = {"role/combat", 1},
	points = 1,
	cooldown = 6,
	power = 2,
	range = 6,
	action = function(self, t)
		local tg = {type="ball", range=self:getTalentRange(t), radius=1, talent=t}
		local x, y = self:getTarget(tg)
		if not x or not y then return nil end
		self:project(tg, x, y, DamageType.ACID, 1 + self:getDex(), {type="acid"})
		return true
	end,
	info = function(self, t)
		return "Zshhhhhhhhh!"
	end,
}

newTalentType{ type="cards", name = "cards", description = "Cards"}

newTalent{
	name = "Summon Jellybean Candy",
	type = {"cards", 1},
	points=1,
	cooldown=0,
	power=0,
	range=5,
	wolf = function(self)
		return {
			name="Jellybean",
			faction = self.faction,
			ai="TEST",
			ai_state = {},
		}
	end,
	action = function(self, t)
		local tg = {type="hit", range=5}
		local x, y = self:getTarget(tg)
		if not x or not y then return nil end
		m = require("mod.class.NPC").new(t.wolf(self))
		game.zone:addEntity(game.level, m, "actor", x, y)
		return true
	end,
	info = function(self, t)
		return "A jellybean"
	end

}

