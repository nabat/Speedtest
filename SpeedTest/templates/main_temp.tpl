<style type="text/css">

    div.meter {
        display: inline-block;
        height: 170px;
        width: 250px;
        text-align: center;
        font-size: 6vw;
    }

    div#testArea {
        display: flex;
        justify-content: center;
        flex-flow: row wrap;
    }

    a {
        text-decoration: none;
    }

    .button {
        display: inline-block;
        margin: 10px 5px 0 2px;
        padding: 16px 40px;
        border-radius: 5px;
        font-size: 18px;
        border: none;
        background: #34aadc;
        color: white;
        cursor: pointer;
        text-transform: uppercase;
        font-weight: 700;
        font-family: 'Sans';
    }

    #ip {
        display: flex;
        justify-content: center;
        flex-flow: row wrap;
        margin: 1em 0;
        font-weight: 600;
        font-size: 1.4em;
    }

    #button_st {
        display: flex;
        justify-content: center;
        flex-flow: row wrap;
    }
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.4/raphael-min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/justgage/1.2.2/justgage.min.js"></script>
<script type="text/javascript">
    var w = null;
    var ggdl, ggul, ggping;

    function runTest() {
        w = new Worker('/images/speedtest/speedtest_worker.min.js')
        var interval = setInterval(function () {
            w.postMessage('status')
        }, 100)
        document.getElementById('abortBtn').style.display = ''
        document.getElementById('startBtn').style.display = 'none'
        w.onmessage = function (event) {
            var data = event.data.split(';')
            var status = Number(data[0])
            var dlStatus = data[1];
            var ulStatus = data[2];
            var pingStatus = data[3];
            var jitterStatus = data[5];
            if (status >= 4) {
                clearInterval(interval)
                document.getElementById('abortBtn').style.display = 'none'
                document.getElementById('startBtn').style.display = ''
                w = null
            }
            updateGauge(ggdl, dlStatus);
            updateGauge(ggul, ulStatus);
            updateGauge(ggping, pingStatus);
            updateGauge(ggjitter, jitterStatus);

            console.log(data);
        }
        w.postMessage('start {"time_ul": "10", "time_dl": "10", "count_ping": "50", "url_dl": "garbage.pl", "url_ul": "empty.pl", "url_ping": "empty.pl", "url_getIp": "getIP.pl"}')
    }

    function abortTest() {
        if (w) w.postMessage('abort')
    }

    document.addEventListener('DOMContentLoaded', function (event) {
        ggdl = new JustGage({
            id: 'ggdl',
            title: 'DOWNLOAD',
            label: 'Mbit/s',
            titleFontFamily: 'Sans',
            valueFontFamily: 'Sans',
            refreshAnimationTime: 300,
            value: 0,
            min: 0,
            max: 10,
            decimals: 2,
            formatNumber: true,
            humanFriendly: false,
            levelColors: [
                '#FF0000',
                '#FF0000'
            ]
        })

        ggul = new JustGage({
            id: 'ggul',
            title: 'UPLOAD',
            label: 'Mbit/s',
            titleFontFamily: 'Sans',
            valueFontFamily: 'Sans',
            refreshAnimationTime: 300,
            value: 0,
            min: 0,
            max: 10,
            decimals: 2,
            formatNumber: true,
            humanFriendly: false,
            levelColors: [
                '#008ab7',
                '#008ab7'
            ]

        })

        ggping = new JustGage({
            id: 'ggping',
            title: 'PING',
            label: 'ms',
            titleFontFamily: 'Sans',
            valueFontFamily: 'Sans',
            refreshAnimationTime: 300,
            value: 0,
            min: 0,
            max: 100,
            decimals: 2,
            formatNumber: true,
            humanFriendly: false,
            levelColors: [
                '#17cd6a',
                '#17cd6a'
            ]
        })
        ggjitter = new JustGage({
            id: 'ggjitter',
            title: 'JITTER',
            label: 'ms',
            titleFontFamily: 'Sans',
            valueFontFamily: 'Sans',
            refreshAnimationTime: 300,
            value: 0,
            min: 0,
            max: 100,
            decimals: 2,
            formatNumber: true,
            humanFriendly: false,
            levelColors: [
                '#17cd6a',
                '#17cd6a'
            ]
        })
    })

    function updateGauge(gauge, value) {
        // Alway use next power of 2 as maximum
        var max = Math.max(Math.pow(2, Math.ceil(Math.log2(value))), gauge.config.max)
        // Refresh the gauge
        gauge.refresh(value, max)
    }
</script>


<div id="testArea">
    <div class="meter" id="ggdl"></div>
    <div class="meter" id="ggul"></div>
    <div class="meter" id="ggping"></div>
    <div class="meter" id="ggjitter"></div>
</div>
<div id="ip">Your API: <span>%YOUR_IP%</span></div>
<div id="button_st">
    <a href="javascript:runTest()" id="startBtn" class="button">Почати</a>
    <a href="javascript:abortTest()" id="abortBtn" class="button" style="display:none;">Зупинити</a>
</div>