options.timeout=30
options.subscribe=true

function getpassword(key)

    local passPipe = assert(io.popen("/usr/bin/security find-generic-password -s imapfilter-" .. key .. "-password -w","r"))

    local res = assert(passPipe:read("*a"))

    passPipe:close()

    return string.gsub(res,"\n","")
end

