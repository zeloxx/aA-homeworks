export const fetchSearchGiphys = (searchTerm) => {
    return $.ajax({
        url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=dc6zaTOxFJmzC&limit=2`,
        method: 'GET',
        dataType: 'json'
    })
}

// difference between POJO and JSON
// when is data used in an ajax request
