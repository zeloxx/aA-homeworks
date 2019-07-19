import * as APIUtil from '../util/api_util';
export const RECEIVE_SEARCH_GIPHYS = 'RECEIVE_SEARCH_GIPHYS';


const receiveSearchGiphys = (giphys) => {
    return {
        type: RECEIVE_SEARCH_GIPHYS,
        giphys: giphys
    }
};