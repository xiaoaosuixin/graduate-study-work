function T_mean=period_mean_fft(data)
%�ú���ʹ�ÿ��ٸ���Ҷ�任FFT��������ƽ������
%data��ʱ������
%T_mean�����ؿ��ٸ���Ҷ�任FFT�����������ƽ������

Y=fft(data); %����FFT�任
N=length(data); %FFT�任�����ݳ���
%fft(detrend(data));
Y(1)=[]; %ȥ��Y�ĵ�һ�����ݣ�����data�������ݵĺ�
power=abs(Y(1:N/2)).^2 ;%������
nyquist=1/2;
freq=(1:N/2)/(N/2)*nyquist; %��Ƶ��
%    subplot(2,2,3)
%    plot(freq,power); 
%    grid on %���ƹ�����ͼ
%    xlabel('Ƶ��')
%    ylabel('����')
%    title('������ͼ')
    period=1./freq ;%��������
%    subplot(2,2,4)
%    plot(period,power);
%    grid on %�������ڣ�����������
%    ylabel('����')
%    xlabel('����')
%    title('���ڡ�������ͼ')
[mp,index] = max(power); %�������������Ӧ���±�
T_mean=period(index);%���±����ƽ������











