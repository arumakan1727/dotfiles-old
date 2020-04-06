# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import *

define_modmap({
    Key.MUHENKAN: Key.RIGHT_META,
    Key.HENKAN: Key.RIGHT_ALT,
})

define_multipurpose_modmap({
    Key.CAPSLOCK: [Key.ESC, Key.LEFT_CTRL],
    Key.ENTER: [Key.ENTER, Key.RIGHT_CTRL],
})

