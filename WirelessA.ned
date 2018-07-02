//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
//

package inet.tutorials.wireless;

import inet.common.figures.DelegateSignalConfigurator;
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.node.inet.INetworkNode;
import inet.physicallayer.contract.packetlevel.IRadioMedium;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;


network WirelessA
{
    parameters:
        string hostType = default("WirelessHost");
        string mediumType = default("IdealRadioMedium");
        @figure[box1](type=rectangle; pos=300,50; size=200,150; fillColor=white; fillOpacity=0.5);
        @figure[box2](type=rectangle; pos=300,250; size=200,150; fillColor=white; fillOpacity=0.5);
        @figure[box3](type=rectangle; pos=300,450; size=200,150; fillColor=white; fillOpacity=0.5);
    	@figure[box4](type=rectangle; pos=50,50; size=200,150; fillColor=white; fillOpacity=0.5);
    	@figure[box5](type=rectangle; pos=50,250; size=200,150; fillColor=white; fillOpacity=0.5);
    	@figure[box6](type=rectangle; pos=50,450; size=200,150; fillColor=white; fillOpacity=0.5);
        @display("bgb=550,650;bgg=100,1,grey95");
        @figure[title](type=label; pos=0,-1; anchor=sw; color=darkblue);

        @figure[rcvdPkText](type=indicatorText; pos=420,20; anchor=w; font=,20; textFormat="packets received: %g"; initialValue=0);
        @statistic[rcvdPk](source=hostB_rcvdPk; record=figure(count); targetFigure=rcvdPkText);
        @signal[hostB_rcvdPk];
        @delegatesignal[rcvdPk](source=hostB.udpApp[0].rcvdPk; target=hostB_rcvdPk);

    submodules:
        visualizer: IntegratedCanvasVisualizer {
            @display("p=800,125");
        }
        configurator: IPv4NetworkConfigurator {
            @display("p=800,200");
        }
        radioMedium: <mediumType> like IRadioMedium {
            @display("p=800,275");
        }
        figureHelper: DelegateSignalConfigurator {
            @display("p=800,350");
        }
        hostA: <hostType> like INetworkNode {
            @display("p=30.976002,326.656");
        }
        hostB: <hostType> like INetworkNode {
            @display("p=270,326");
        }
        hostC: <hostType> like INetworkNode {
            @display("p=30.976002,557.568");
        }
        hostD: <hostType> like INetworkNode {
            @display("p=478,21");
        }
        hostE: <hostType> like INetworkNode {
            @display("p=30.976002,233.72801");
        }
        hostF: <hostType> like INetworkNode {
            @display("p=30,21");
        }
        hostG: <hostType> like INetworkNode {
            @display("p=270,185");
        }
        hostH: <hostType> like INetworkNode {
            @display("p=132,21");
        }





}

//##### (marker for doxygen)

