-module(fernet_b64).
-export([encode/1, decode/1]).


-spec encode(binary()) -> binary().
encode(Bin) -> << <<(escape(D))>> || <<D>> <= base64:encode(Bin)>>.

-spec decode(iodata()) -> binary().
decode(Str) -> base64:decode(<< <<(unescape(D))>> || <<D>> <= iolist_to_binary(Str)>>).

escape($/) -> $_;
escape($+) -> $-;
escape(D)  -> D.

unescape($_) -> $/;
unescape($-) -> $+;
unescape(D)  -> D.
