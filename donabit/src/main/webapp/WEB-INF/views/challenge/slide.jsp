<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <style>
        ul,
        li {
            list-style: none;
        }

        [name="slide"] {
            display: none;
        }

        .slidebox {
            max-width: 1000px;
            width: 100%;
            margin: 0 auto;
            text-align: center;
        }

        .slidebox img {
            max-width: 100%;
        }

        .slidebox .slidelist {
            white-space: nowrap;
            font-size: 0;
            overflow: hidden;
        }

        .slidebox .slideitem {
            position: relative;
            display: inline-block;
            vertical-align: middle;
            width: 100%;
            transition: all .35s;
        }

        .slidebox .slideitem label {
            position: absolute;
            z-index: 1;
            top: 50%;
            transform: translateY(-50%);
            padding: 20px;
            border-radius: 50%;
            cursor: pointer;
        }

        .slidebox {
            /*margin-top: 20px;*/
        }



        /* 페이징 스타일 */
        .paginglist {
            text-align: center;
            padding: 30px 0;
        }

        .paginglist>li {
            display: inline-block;
            vertical-align: middle;
            margin: 0 10px;
        }

        .paginglist>li>label {
            display: block;
            padding: 10px 30px;
            border-radius: 10px;
            background: #ccc;
            cursor: pointer;
        }

        .paginglist>li:hover>label {
            background: #333;
        }

        [id="slide01"]:checked~.slidelist .slideitem {
            transform: translateX(0);
            animation: slide01 10s infinite;
        }

        [id="slide02"]:checked~.slidelist .slideitem {
            transform: translateX(-100%);
            animation: slide02 10s infinite;
        }

        [id="slide03"]:checked~.slidelist .slideitem {
            transform: translateX(-200%);
            animation: slide03 10s infinite;
        }

        [id="slide04"]:checked~.slidelist .slideitem {
            transform: translateX(-300%);
            animation: slide04 10s infinite;
        }

        @keyframes slide01 {
            0% {
                left: 0%;
            }

            23% {
                left: 0%;
            }

            25% {
                left: -100%;
            }

            48% {
                left: -100%;
            }

            50% {
                left: -200%;
            }

            73% {
                left: -200%;
            }

            75% {
                left: -300%;
            }

            98% {
                left: -300%;
            }

            100% {
                left: 0%;
            }
        }

        @keyframes slide02 {
            0% {
                left: 0%;
            }

            23% {
                left: 0%;
            }

            25% {
                left: -100%;
            }

            48% {
                left: -100%;
            }

            50% {
                left: -200%;
            }

            73% {
                left: -200%;
            }

            75% {
                left: 100%;
            }

            98% {
                left: 100%;
            }

            100% {
                left: 0%;
            }
        }

        @keyframes slide03 {
            0% {
                left: 0%;
            }

            23% {
                left: 0%;
            }

            25% {
                left: -100%;
            }

            48% {
                left: -100%;
            }

            50% {
                left: 200%;
            }

            73% {
                left: 200%;
            }

            75% {
                left: 100%;
            }

            98% {
                left: 100%;
            }

            100% {
                left: 0%;
            }
        }

        @keyframes slide04 {
            0% {
                left: 0%;
            }

            23% {
                left: 0%;
            }

            25% {
                left: 300%;
            }

            48% {
                left: 300%;
            }

            50% {
                left: 200%;
            }

            73% {
                left: 200%;
            }

            75% {
                left: 100%;
            }

            98% {
                left: 100%;
            }

            100% {
                left: 0%;
            }
        }
    </style>
    <div class="slidebox">
        <input type="radio" name="slide" id="slide01" checked>
        <input type="radio" name="slide" id="slide02">
        <input type="radio" name="slide" id="slide03">
        <input type="radio" name="slide" id="slide04">
        <ul class="slidelist">
            <li class="slideitem">
                <div>
                    <a id="alogo1"></a>
                </div>
            </li>
            <li class="slideitem">
                <div>
                    <a id="alogo2"></a>
                </div>
            </li>
            <li class="slideitem">
                <div>
                    <a id="alogo3"></a>
                </div>
            </li>
            <li class="slideitem">
                <div>
                    <a id="alogo4"></a>
                </div>
            </li>
        </ul>

    </div>

    <script>
        $(document).ready(function () {
            var alogo1 = document.getElementById("alogo1");
            var alogo2 = document.getElementById("alogo2");
            var alogo3 = document.getElementById("alogo3");
            var alogo4 = document.getElementById("alogo4");
            var num1 = Math.floor(Math.random() * 12) + 1;
            var num2 = Math.floor(Math.random() * 12) + 1;
            var num3 = Math.floor(Math.random() * 12) + 1;
            var num4 = Math.floor(Math.random() * 12) + 1;
            $("#alogo1").prepend("<img src='../img/logo_" + num1 + ".png'>");
            $("#alogo2").prepend("<img src='../img/logo_" + num2 + ".png'>");
            $("#alogo3").prepend("<img src='../img/logo_" + num3 + ".png'>");
            $("#alogo4").prepend("<img src='../img/logo_" + num4 + ".png'>");
            /*1~12 랜덤 숫자*/
        });


    </script>