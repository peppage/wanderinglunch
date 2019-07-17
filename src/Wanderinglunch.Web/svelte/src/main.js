import AdminQueue from './AdminQueue.svelte'
import LocationList from './LocationList.svelte'

const adminQueue = new AdminQueue({
	target: document.querySelector('#adminQueue')
})

const locationList = new LocationList({
	target: document.querySelector("#locationList")
})

export default { adminQueue, locationList }
