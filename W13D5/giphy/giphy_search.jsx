import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { fetchSearchGiphys } from './util/api_util';

window.fetchSearchGiphys = fetchSearchGiphys



{/* <script>
    (function () {
        var httpRequest;
        document.getElementById("ajaxButton").addEventListener('click', makeRequest);

        function makeRequest() {
            httpRequest = new XMLHttpRequest();

            if (!httpRequest) {
                alert('Giving up :( Cannot create an XMLHTTP instance');
                return false;
            }
            httpRequest.onreadystatechange = alertContents;
            httpRequest.open('GET', 'test.html');
            httpRequest.send();
        }

        function alertContents() {
            if (httpRequest.readyState === XMLHttpRequest.DONE) {
                if (httpRequest.status === 200) {
                    alert(httpRequest.responseText);
                } else {
                    alert('There was a problem with the request.');
                }
            }
        }
    })();
</script > */}